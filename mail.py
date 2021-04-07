import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from email.mime.image import MIMEImage

from databaseConfig import *

# Email you want to send the update from (only works with gmail)
fromEmail = mailInfo['email']
fromEmailPassword = mailInfo['password']

# Email you want to send the update to
# toEmail = 'hemantlader@gmail.com'

def sendEmail(image,uid):
	toEmail = sendAlertToAll(uid)
	msgRoot = MIMEMultipart('related')
	msgRoot['Subject'] = 'The Fourth Eye - Security Alert'
	msgRoot['From'] = fromEmail
	# msgRoot['To'] = toEmail
	msgRoot.preamble = 'Raspberry pi security camera update'

	msgAlternative = MIMEMultipart('alternative')
	msgRoot.attach(msgAlternative)
	msgText = MIMEText('Smart security cam found object')
	msgAlternative.attach(msgText)

	text = '<strong>Some suspecious activity detected. Take a look.</strong><br> <img src="cid:image1"> <br> <em>The FourthEye</em>'
	msgText = MIMEText(text, 'html')
	msgAlternative.attach(msgText)

	msgImage = MIMEImage(image)
	msgImage.add_header('Content-ID', '<image1>')
	msgRoot.attach(msgImage)

	smtp = smtplib.SMTP('smtp.gmail.com', 587)
	smtp.starttls()
	smtp.login(fromEmail, fromEmailPassword)
	smtp.sendmail(fromEmail, toEmail, msgRoot.as_string())
	smtp.quit()