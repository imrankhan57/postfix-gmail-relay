#!/bin/bash
# Postfix Gmail Relay Setup Script for CentOS 9
# Author: Your Name

set -e

echo "=== Installing Postfix and dependencies ==="
dnf install -y postfix cyrus-sasl cyrus-sasl-plain s-nail

read -p "Enter your Gmail address: " GMAIL_USER
read -s -p "Enter your Gmail App Password: " GMAIL_PASS
echo

echo "=== Configuring Postfix for Gmail relay ==="
cat >> /etc/postfix/main.cf <<EOF

# Gmail Relay Settings
relayhost = [smtp.gmail.com]:587
smtp_sasl_auth_enable = yes
smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd
smtp_sasl_security_options = noanonymous
smtp_use_tls = yes
smtp_tls_security_level = encrypt
smtp_tls_CAfile = /etc/ssl/certs/ca-bundle.crt
EOF

echo "[smtp.gmail.com]:587 $GMAIL_USER:$GMAIL_PASS" > /etc/postfix/sasl_passwd
chmod 600 /etc/postfix/sasl_passwd
postmap /etc/postfix/sasl_passwd

echo "=== Enabling and restarting Postfix ==="
systemctl enable --now postfix

echo "=== Testing email ==="
echo "Postfix Gmail relay is working on $(hostname)" | s-nail -s "Test Email" $GMAIL_USER

echo "=== Setup complete! Check your Gmail inbox for the test email. ==="
