flutter clean
flutter pub get
flutter build web --release
rsync -avL --progress -e "ssh -i ~/Documents/ssh/ubuntu_keypair.pem" ../build/web/*  ubuntu@ec2-65-1-111-124.ap-south-1.compute.amazonaws.com:/var/www/akash-megamart.sarankar.com

