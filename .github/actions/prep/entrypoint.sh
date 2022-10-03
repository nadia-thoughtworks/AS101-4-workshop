#!/bin/sh
echo $VAULT_PASS > /vault_pass.txt
echo "::add-mask::$POSTGRES_USER"
echo "::add-mask::$POSTGRES_PASSWORD"
echo "::add-mask::$POSTGRES_DB"
echo $(ansible-vault view --vault-password-file=/vault_pass.txt env_secrets)|xargs -n1 >> $GITHUB_ENV
rm /vault_pass.txt