#!/bin/bash
set -e

export OCF_RESKEY_pgdata=$PGDATA

if [[ -z "$OCF_RESKEY_pgdata" ]]; then
    echo "no PGDATA specified!"
    exit 1
fi

echo "Using \"$PGSQL_HOME\" PostgreSQL installation"

export OCF_RESKEY_pgpidfile=$PGDATA/postmaster.pid
export OCF_RESKEY_primary_db=repmgr
export OCF_RESKEY_primary_host=192.168.0.60
export OCF_RESKEY_primary_port=$PGPORT
export OCF_RESKEY_primary_user=repmgr

export OCF_RESKEY_resowner=bhe
export OCF_RESKEY_rsync_user=$OCF_RESKEY_resowner

export OCF_RESKEY_wal_keep_segments=128
export OCF_RESKEY_repmgr_config="/home/bhe/repmgr.conf"
export OCF_RESKEY_pgctl=$PGSQL_HOME/bin/pg_ctl
export OCF_RESKEY_repmgrbindir=$PGSQL_HOME/bin
export OCF_RESKEY_psqlbin=$PGSQL_HOME/bin/psql

export OCF_ROOT=/usr/lib/ocf/
export OCF_RESKEY_tmpdir=/home/bhe
export PATH=$PATH:$PGSQL_HOME/bin

../ocf/credativ/pgrepmgr_test $1
