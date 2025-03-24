#! /bin/bash

set -e

cd `dirname $0`/../..

export GNUPGHOME=testing/gnupg
export PYTHONPATH=`pwd`

rm -rf ~/.cache/duplicity/issue883 /tmp/issue883
duplicity/__main__.py --name issue883 --metadata-sync-mode partial --encrypt-key 839E6A2856538CCF full testing file:///tmp/issue883/

rm -rf ~/.cache/duplicity/issue883
duplicity/__main__.py --name issue883 --metadata-sync-mode partial --encrypt-key 839E6A2856538CCF full testing file:///tmp/issue883/

ls -l ~/.cache/duplicity/issue883 /tmp/issue883
