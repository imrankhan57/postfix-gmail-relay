Postfix Gmail Relay Setup on CentOS 9

This repository provides a script to configure Postfix on CentOS 9 to relay outbound emails through Gmail SMTP.
It’s useful for servers that need to send email alerts, system notifications, or application messages using Gmail as the relay host.

🚀 Features

Configures Postfix with Gmail SMTP relay

Enables SASL authentication with Gmail credentials

Secures connection using TLS

Supports logging for troubleshooting

📋 Prerequisites

CentOS 9 (Stream or RHEL 9 compatible)

Root or sudo privileges

A Gmail account (preferably with App Passwords
)

Internet connectivity

⚡ Installation

Clone this repository:

git clone https://github.com/imrankhan57/postfix-gmail-relay.git
cd postfix-gmail-relay


Make the script executable:

chmod +x setup_postfix_gmail.sh


Run the script:

sudo ./setup_postfix_gmail.sh

⚙️ Script Overview

The script will:

Install Postfix and required packages

Configure /etc/postfix/main.cf for Gmail relay

Create /etc/postfix/sasl_passwd with your Gmail credentials

Hash the credentials with postmap

Restart and enable Postfix

🔑 Gmail Credentials

You will be prompted to enter your Gmail username and an App Password (recommended instead of your actual password).
Example App Password setup:

Go to Google Account → Security → App Passwords

Generate a 16-character password for "Mail" and "Linux"
