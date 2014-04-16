#!/bin/sh
#

sudo riak attach -noinput -noshell << QUERY
code:which(riak_cs_kv_multi_backend).
QUERY

exit

