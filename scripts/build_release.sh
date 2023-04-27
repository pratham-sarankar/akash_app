flutter clean
flutter pub get
flutter build web --web-renderer canvaskit --release --dart-define=host=https://akash-megamart-api.sarankar.com
rsync -avL --progress -e "ssh -i ~/Documents/ssh/ubuntu_keypair.pem" ../build/web/*  ubuntu@ec2-65-1-73-129.ap-south-1.compute.amazonaws.com:/var/www/html

ssh -i ~/Documents/ssh/ubuntu_keypair.pem ubuntu@ec2-65-1-111-124.ap-south-1.compute.amazonaws.com << EOF
sudo nginx -t
sudo service nginx restart
EOF
