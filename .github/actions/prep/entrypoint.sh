#!/bin/sh
echo $VAULT_PASS > /vault_pass.txt
$(ansible-vault view --vault-password-file=/vault_pass.txt env_secrets)|xargs -n1
echo "::add-mask::$POSTGRES_USER"
echo "::add-mask::$POSTGRES_PASSWORD"
echo "::add-mask::$POSTGRES_DB"
echo  POSTGRES_USER=$POSTGRES_USER >> $GITHUB_ENV
echo  POSTGRES_PASSWORD=$POSTGRES_PASSWORD >> $GITHUB_ENV
echo  POSTGRES_DB=$POSTGRES_DB >> $GITHUB_ENV
rm /vault_pass.txt