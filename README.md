Usage
-----

```
  vagrant up

  ## to generate a new SSH keypair, just ssh into the box:
  vagrant ssh
  sudo ssh-keygen -t rsa -b 4096 -f /root/.ssh/id_rsa
```

After a while, point your browser to https://cc-compliance.local/#/setup and finish setup process.

In order to access your target Linux nodes by SSH, just copy the *PUBLIC* ssh key (/root/.ssh/id_rsa.pub) to any destination and add the *private* one to the Chef Compliance Server (web UI).

