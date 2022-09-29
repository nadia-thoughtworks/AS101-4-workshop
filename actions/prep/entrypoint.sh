#!/bin/sh
echo $VAULT_PASS > /Users/nadia/ansible_pass.txt
echo $(ansible-vault view --vault-password-file=/Users/nadia/ansible_pass.txt env_secrets)|xargs -n1 >> $GITHUB_ENV 
rm /Users/nadia/ansible_pass.txt
