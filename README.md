# private_vagrant_cloud_vagrantfile

- `vagrant init -m vagrant/xenial64`
- edit Vagrantfile:
```Vagrant.configure("2") do |config|
  config.vm.box = "vagrant/xenial64"
  config.vm.box_url = "http://localhost:8080/vagrant/xenial64/"
end
```

## When it's not working?
- It's `not working` when I use ENV Variable: `export VAGRANT_SERVER_URL="http://localhost:8080"`
- Vagrantfile:
```Vagrant.configure("2") do |config|
  config.vm.box = "vagrant/xenial64"  
end
```
- Error:
```The box 'vagrant/xenial64' could not be found or
could not be accessed in the remote catalog. If this is a private
box on HashiCorp's Vagrant Cloud, please verify you're logged in via
`vagrant login`. Also, please double-check the name. The expanded
URL and error message are shown below:

URL: ["http://localhost:8080/vagrant/xenial64"]
Error: Failed to connect to localhost port 80: Connection refused
```
