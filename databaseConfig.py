import pyrebase
import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from email.mime.image import MIMEImage

mailInfo ={'email':'raspi7897@gmail.com', 'password':'Raspberry3.14', 'subject':'FourthEye '}
cred = {'apiKey': "AIzaSyAW4niLmnswOOTCMp9jXF7qTLyFPzT97_s", 'authDomain': "fourtheye-78p97s.firebaseapp.com", 'databaseURL': "https://fourtheye-78p97s.firebaseio.com", 'projectId': "fourtheye-78p97s", 'storageBucket': "fourtheye-78p97s.appspot.com", 'messagingSenderId': "285551001950"}

def notifyPeople(user,toMail,name):
    server = smtplib.SMTP('smtp.gmail.com',587)
    server.starttls()
    server.login(mailInfo['email'],mailInfo['password'])
    msg = MIMEMultipart()
    msg['From'] = mailInfo['email']
    msg['To'] = toMail
    msg['Subject'] = mailInfo['subject'] + "- "+user+" added you"
    body = "Dear "+name+",<br> &nbsp; &nbsp; The FourthEye user <strong>"+user+"</strong>, added you as a trusted person. Now you will also receive security alert from <strong>The FourthEye</strong><br><em>Congratulations</em><br><br><strong>Thank you</strong><br><em>The FourthEye Team</em><br>GEC Bilaspur"
    msg.attach(MIMEText(body,'html'))
    text = msg.as_string()
    try:
        server.sendmail(mailInfo['email'],toMail,text)
    except Exception as e:
        print("Error in sending mail. Error : "+ e)
    finally:
        server.quit()
    return True

firebase = pyrebase.initialize_app(cred)
auth = firebase.auth()
db = firebase.database()

#notify people on adding
def addPeople(personInfo,uid):
    res = db.child('users').child(uid).child('people').push(personInfo)
    if res:
        userNameTemp = db.child('users').child(uid).child('name').get().val().capitalize()
        return notifyPeople(userNameTemp,personInfo['email'],personInfo['name'])
    else:
        print("Failed adding person")
        return False

def getPeople(uid):
    userId = uid
    peoples=None
    res = db.child('users').child(userId).child('people').get().val()
    if res:
        peoples=[]
        res = db.child('users').child(userId).child('people').get()

        all_people = db.child("users").child(userId).child('people').get()
        for person in all_people.each():
            temp ={'key':person.key(), 'name':person.val()['name'], 'email':person.val()['email'], 'contact':person.val()['contact']} 
            peoples.append(temp)
    return peoples

def updatePeople(person, key,uid):
    res = db.child('users').child(uid).child('people').child(key).update(person)
    return res

def getUser():
    uid =session['uid']
    data = db.child('users').child(uid).get().val()
    # for d in data.each():
    userData={
    'name':data['name'],
    'email':data['email'],
    'city':data['city'],
    'country':data['country'],
    'address':data['address']    }
    # print(userData)
    return userData

def sendAlertToAll(uid):
    sendList =  db.child('users').child(uid).get().val()['email']
    res = db.child('users').child(uid).child('people').get().val()
    if res:
        peopleData = db.child('users').child(uid).child('people').get().val().values()
        # print(umail)
        emailList=[ data['email'] for data in peopleData ]
        sendList = sendList+emailList
    print(sendList)
    return sendList
