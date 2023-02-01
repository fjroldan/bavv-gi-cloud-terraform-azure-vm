#!/bin/bash

# CIS RHEL 8 Benchmark - Output files

# 1.2.4
(sudo cat /etc/yum.repos.d/rh-cloud.repo) > package-manager-config.txt

# 1.6.1.6
(sudo ps -eZ | sudo grep unconfined_service_t) > unconfined-service.txt

# 2.4
(sudo lsof -i -P -n | sudo grep -v "(ESTABLISHED)") > nonessential-services.txt

# 3.4.3.2.3
# la sección 3.4.3 debido a que se debe trabajar firewalld, nftables o iptables (solo uno al tiempo)
# en este caso se trabajará con firewalld (toda la sección 3.4.1)
#(ss -4tuln) > opened-ports-IPv4.txt
#(sudo  iptables -L INPUT -v -n) > firewall-rules-IPv4.txt

# 3.4.3.3.3
# Se saltará toda la sección 3.4.3.3 debido a que se deshabilitó IPv6 en 3.1.1
#(ss -6tuln) > opened-ports-IPv6.txt
#(sudo ip6tables -L INPUT -v -n) > firewall-rules-IPv6.txt

# 5.3.4
(sudo grep -r "^[^#].*NOPASSWD" /etc/sudoers*) > ~/no-password.txt

# 5.3.5
(sudo grep -r "^[^#].*\!authenticate" /etc/sudoers*) > ~/re-auth.txt

# 5.3.6
(sudo  grep -roP "timestamp_timeout=\K[0-9]*" /etc/sudoers*) > sudo-auth-timeout.txt

# 5.6.1.5
(sudo awk -F: '/^[^:]+:[^!*]/{print $1}' /etc/shadow | while read -r usr; \
do change=$(date -d "$(chage --list $usr | grep '^Last password change' | cut -d: -f2 | grep -v 'never$')" +%s); \
if [[ "$change" -gt "$(date +%s)" ]]; then \
echo "User: \"$usr\" last password change was \"$(chage --list $usr | grep '^Last password change' | cut -d: -f2)\""; fi; done) > last-pass-change-txt

# 6.1.11
(sudo df --local -P | sudo awk '{if (NR!=1) print $6}' | sudo xargs -I '{}' find '{}' -xdev -type f -perm -0002) > world-writable-files.txt

# 6.1.12
(sudo df --local -P | sudo awk {'if (NR!=1) print $6'} | sudo xargs -I '{}' find '{}' -xdev -nouser) > unowned-directories-files.txt

# 6.1.13
(sudo df --local -P | sudo awk '{if (NR!=1) print $6}' | sudo xargs -I '{}' find '{}' -xdev -nogroup) > ungrouped-directories-files.txt

# 6.1.14
(sudo df --local -P | sudo awk '{if (NR!=1) print $6}' | sudo xargs -I '{}' find '{}' -xdev -type f -perm -4000) > SUID-files.txt

# 6.1.15
(sudo df --local -P | sudo awk '{if (NR!=1) print $6}' | sudo xargs -I '{}' find '{}' -xdev -type f -perm -2000) > SGID-files.txt

# 6.2.2
cat << \EOF >  groupsexistin-passwd-group.sh
#!/bin/bash
for i in $(sudo cut -s -d: -f4 /etc/passwd | sort -u ); do
 sudo grep -q -P "^.*?:[^:]*:$i:" /etc/group
 if [ $? -ne 0 ]; then
    echo "Group $i is referenced by /etc/passwd but does not exist in /etc/group"
 fi
done
EOF

chmod +x groupsexistin-passwd-group.sh

# 6.2.3
cat << \EOF >  UIDs-duplicate.sh
#!/bin/bash
sudo cut -f3 -d":" /etc/passwd | sort -n | uniq -c | while read x ; do
 [ -z "$x" ] && break
 set - $x
 if [ $1 -gt 1 ]; then
    users=$(awk -F: '($3 == n) { print $1 }' n=$2 /etc/passwd | xargs)
    echo "Duplicate UID ($2): $users"
 fi
done
EOF

chmod +x UIDs-duplicate.sh


# 6.2.4
cat << \EOF >  GIDs-duplicate.sh
#!/bin/bash 
sudo cut -d: -f3 /etc/group | sort | uniq -d | while read x ; do
 echo "Duplicate GID ($x) in /etc/group"
done
EOF

chmod +x GIDs-duplicate.sh


# 6.2.5
cat << \EOF >  username-duplicate.sh
#!/bin/bash
sudo cut -d: -f1 /etc/passwd | sort | uniq -d | while read x
do echo "Duplicate login name ${x} in /etc/passwd"
done
EOF

chmod +x username-duplicate.sh


# 6.2.6
cat << \EOF >  group-duplicate.sh
#!/bin/bash
sudo cut -d: -f1 /etc/group | sort | uniq -d | while read x
do echo "Duplicate group name ${x} in /etc/group"
done
EOF

chmod +x group-duplicate.sh


# 6.2.7
cat << \EOF >  root-PATH-Integrity.sh
#!/bin/bash
RPCV="$(sudo -Hiu root env | grep '^PATH=' | cut -d= -f2)"
echo "$RPCV" | grep -q "::" && echo "root's path contains a empty directory (::)"
echo "$RPCV" | grep -q ":$" && echo "root's path contains a trailing (:)"
for x in $(echo "$RPCV" | tr ":" " "); do
 if [ -d "$x" ]; then
    ls -ldH "$x" | awk '$9 == "." {print "PATH contains current working directory (.)"} $3 != "root" {print $9, "is not owned by root"} substr($1,6,1) != "-" {print $9, "is group writable"} substr($1,9,1) != "-" {print $9, "is world writable"}'
 else
    echo "$x is not a directory"
 fi
done
EOF

chmod +x root-PATH-Integrity.sh

# -----------------------------------------------------------------------------------------------------------------------------------

echo "Los output files se encuentran en el home directory"