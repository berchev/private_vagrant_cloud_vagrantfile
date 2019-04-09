Vagrant.configure("2") do |config|
  config.vm.box = "berchev/nginx64"
  config.vm.hostname = "boxcloud.com"
  config.vm.provision "shell", path: "scripts/provision.sh"
  config.vm.network "forwarded_port", guest: 80, host: 8080,
    auto_correct: true
end
