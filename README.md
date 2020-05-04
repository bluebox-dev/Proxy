# Proxy
Proxy As a Service System OS
> Install system requirement : [Ubuntu or Centos]

## DockerSwarm Reference install
```
--- Option Main
(+) Proxy Basic
(+) Proxy Curl
(+) Proxy Docker
```
> File Manin: $ Bash Language : [File proxy.sh]()

### Detail Used (root) :
```
    $ cd /Proxy
    $ sh proxy.sh
```
### Detail RunScript
> 1) IP-Proxy:
##### Answer:: IP ex. 192.xxx.xxx.x
> 2) Port-Proxy:
##### Answer:: Port ex. 3128

> 3) Do you want to have as a username/password proxy ? [Y/n] 
##### Answer:: y or n  (but 'n' >> have not proxy username/password)

> 4) Do you want to username/password correct ? [Y/n]
##### Answer:: y or n  (but 'n' >> username/password incorrect program exit and try start program agin) 

> 5) Set Proxy Basic ALL OS
Do you want to continue? [Y/n]
##### Answer:: y or n  (but 'n' >> Exit program ; 'y' >> Set proxy basic )

> 6) Set Proxy Curl ALL OS
Do you want to continue? [Y/n]
##### Answer:: y or n  (but 'n' >> Exit program ; 'y' >> Set proxy curl )

> 7) Set Proxy Docker ALL OS
Do you want to continue? [Y/n]
##### Answer:: y or n  (but 'n' >> Exit program ; 'y' >> Set proxy docker )