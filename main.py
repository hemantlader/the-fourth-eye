import cv2
import sys
from mail import sendEmail
from flask import Flask, render_template, Response, request, redirect, session
from camera import VideoCamera
from flask_basicauth import BasicAuth
import time
import threading

from databaseConfig import *

email_update_interval = 60 # sends an email only once in this time interval
video_camera = VideoCamera(flip=True) # creates a camera object, flip vertically
object_classifier = cv2.CascadeClassifier("models/facial_recognition_model.xml") # an opencv classifier

# App Globals (do not edit)
app = Flask(__name__)
#app.config['BASIC_AUTH_USERNAME'] = 'MINOR'
#app.config['BASIC_AUTH_PASSWORD'] = 'PROJECT'
#app.config['BASIC_AUTH_FORCE'] = True

#basic_auth = BasicAuth(app)
last_epoch = 0

def check_for_objects():
    if 'uid' not in session:
        pass
    else:
        global last_epoch
        while True:
            try:
                frame, found_obj , disp = video_camera.get_object(object_classifier)
                #print(time.time() - last_epoch)
                if found_obj and (time.time() - last_epoch) > email_update_interval:
                    last_epoch = time.time()
                    print( "Sending email...")
                    sendEmail(frame,session['uid'])
                    print ("done!")
            except:
                print ("Error sending email: ", sys.exc_info()[0])


app = Flask(__name__)
app.secret_key = "TheFourthEye"

@app.route('/', methods = ['GET', 'POST'])
def index(): 
    if 'uid' in session : 
        return redirect('dashboard')
    return render_template('index.html')

@app.route('/login', methods = ['GET', 'POST'])
def login():
    if request.method == 'POST':
        email = request.form['email']
        passw = request.form['password']
        try:
            user = auth.sign_in_with_email_and_password(email,passw)
            info = auth.get_account_info(user['idToken'])['users'][0]
            # print(info)
            userDataHolder = {'id' : info['localId'], 'email' : info['email'], 'isVerified' : info['emailVerified'], 'lastLogin' : info['lastLoginAt'], 'createdAt' : info['createdAt'], 'passUpdatedAt':info['passwordUpdatedAt'] } 

            if userDataHolder['isVerified'] == False : 
                auth.send_email_verification(user['idToken'])
                return """<div style="margin:auto;text-align:center;padding:30px;font-size:22px;">
                <p>Please verify your email and <a href="/"> try again</a> 
                </p>
                </div>"""
            session['uid']= userDataHolder['id']

        except :
            return """<div style="margin:auto;text-align:center;padding:30px;font-size:22px;">
                <p>
                Error in signing in. Check your credentials and <a href="/"> try again</a> 
                </p>
                </div>"""

        print('Login ')
        return redirect('/dashboard')
    else:
        return redirect('/')

@app.route('/logout')
def logout():
    if 'uid' in session :
        session.pop('uid', None)
        return redirect('/')
    else:
        return redirect('/')

@app.route('/signup',methods=['POST','GET'])
def signup():
    if request.method == 'POST':
        name = request.form['signUpName']
        email = request.form['registerEmail']
        passw = request.form['registerPassword']

        profileInfo ={'name':name, 'email': email, 'contact':'', 'city':'', 'country':'', 'address':''} 
        try:
            # print(name,email,passw)
            user = auth.create_user_with_email_and_password(email,passw)

            info = auth.get_account_info(user['idToken'])['users'][0]
            # print(info)
            userDataHolder = {'id' : info['localId'], 'email' : info['email'], 'isVerified' : info['emailVerified'], 'lastLogin' : info['lastLoginAt'], 'createdAt' : info['createdAt'], 'passUpdatedAt':info['passwordUpdatedAt'] } 
            
            auth.send_email_verification(user['idToken']) 
            

            db.child('users').child(userDataHolder['id']).set(profileInfo)
            
        except:
            return """<div style="margin:auto;text-align:center;padding:30px;font-size:22px;">
                <p>
                    Error signnig up please <a href="/">try agin</a>.
                    </p>
                </div>"""
        print('Logout')
        return """<div style="margin:auto;text-align:center;padding:30px;font-size:22px;">
            <p>
                Please verify your email and then <a href="/">login</a> to edit profile and continue.
                </p>
            </div>"""
    else:
        return redirect('/')

@app.route('/live_feed')
def live_feed():
    if 'uid' not in session:
        return redirect('/')
    return render_template('live_feed.html')

@app.route('/dashboard')
def dashboard():
    if 'uid' not in session:
        return redirect('/')
    userId = session['uid']
    peopleName = None
    res = db.child('users').child(userId).child('people').get().val()
    if res :
        res = db.child('users').child(userId).child('people').get().val().values()
        peopleName=[]
        for r in res:
          peopleName.append(r['name'])
    # print(peopleName)
    return render_template('dashboard.html',peopleName=peopleName)

@app.route('/switch_control')
def switch_control():
    if 'uid' not in session:
        return redirect('/')
    return render_template('switch_control.html')

@app.route('/profile',methods=['GET','POST'])
def profile():
    if 'uid' not in session:
        return redirect('/')

    if request.method == 'POST':
        name= request.form['name']
        email = request.form['email']
        contact = request.form['cont']
        city = request.form['city']
        country = request.form['country']
        address = request.form['addr']
        data ={
        'name':name,
        'email':email,
        'contact':contact,
        'city':city,
        'country':country,
        'address':address }
        print(data)
        res = db.child('users').child(session['uid']).update(data)
        print(res)
        return redirect('/profile')

    user = getUser()
    return render_template('profile.html',user = user)

@app.route('/profile/<key>',methods=['POST','GET'])
def named_profile(key):
    if 'uid' not in session:
        return redirect('/')
    if request.method =='POST':
        uid =session['uid']
        name = request.form['name']
        contact = request.form['contact']
        email = request.form['email']
        person = {'name':name, 'email':email, 'contact':contact }
        res = updatePeople(person,key,uid)
        print(res)
        return redirect('/profile/'+key)

    peoples = getPeople(session['uid'])
    if peoples:
        data = None
        if key in [x['key'] for x in peoples ]:
            for p in peoples:
                if key == p['key']:
                    data = {'key': p['key'] , 'name':p['name'], 'contact':p['contact'], 'email':p['email']}
                    break
        else:
            redirect('/')
        return render_template('namedProfile.html',data = data ,peoples=peoples)
    else:
        return redirect('/')

@app.route('/delete/<key>',methods=['POST','GET'])
def deletePeople(key):
    if 'uid' not in session:
        return redirect('/')
    if request.method == 'POST':
        uid = session['uid']
        key = request.form['key']
        res = db.child('users').child(uid).child('people').child(key).remove()
        return redirect('/people')
    return redirect('/')

@app.route('/people',methods=['POST','GET'])
def people():
    if 'uid' not in session:
        return redirect('/')
    if request.method =='POST':
        uid = session['uid']
        name= request.form['name']
        email = request.form['email']
        contact = request.form['cont']
        person = {'name':name, 'email':email, 'contact':contact }
        if addPeople(person,uid):
            return redirect('/people')

    peoples = getPeople()
    # print(peoples)
    return render_template('people.html',peoples=peoples)

# def gen(camera):
#     while True:
#         frame = camera.get_frame()
#         yield (b'--frame\r\n'
#                b'Content-Type: image/jpeg\r\n\r\n' + frame + b'\r\n\r\n')

def gen(camera):
    while True:
        frame = camera.get_frame(object_classifier)
        yield (b'--frame\r\n'
               b'Content-Type: image/jpeg\r\n\r\n' + frame + b'\r\n\r\n')


# @app.route('/video_feed')
# def video_feed():
#     if 'uid' not in session:
#         return redirect('/')
#     return Response(gen(VideoCamera()),
#                     mimetype='multipart/x-mixed-replace; boundary=frame')

@app.route('/video_feed')
def video_feed():
    if 'uid' not in session:
        return redirect('/')
    return Response(gen(video_camera),
                    mimetype='multipart/x-mixed-replace; boundary=frame')



# if __name__ == '__main__':
#     app.run(host='0.0.0.0', debug=True)


if __name__ == '__main__':
    t = threading.Thread(target=check_for_objects, args=())
    t.daemon = True
    t.start()
    app.run(host='0.0.0.0', debug=False)



#@app.route('/')
#@basic_auth.required
#def index():
 #   return render_template('index.html')



# @app.route('/')
# def index():
# 	return render_template('index.html')

# @app.route('/live_feed')
# def live_feed():
#     return render_template('live_feed.html')

# @app.route('/dashboard')
# def dashboard():
#     return render_template('dashboard.html')

# @app.route('/switch_control')
# def switch_control():
#     return render_template('switch_control.html')

# @app.route('/profile')
# def profile():
#     return render_template('profile.html')

# @app.route('/profile/<name>')
# def named_profile(name):
#     return render_template('namedProfile.html',name=name)

# @app.route('/people')
# def people():
#     return render_template('people.html')


# if __name__ == '__main__':
#     t = threading.Thread(target=check_for_objects, args=())
#     t.daemon = True
#     t.start()
#     app.run(host='0.0.0.0', debug=False)
