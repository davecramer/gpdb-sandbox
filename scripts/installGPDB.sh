#!/usr/bin/env bash
source /tmp/release.properties




install_gpdb(){
 source /usr/local/greenplum-db-5/greenplum_path.sh
 /usr/local/greenplum-db-5/bin/gpssh-exkeys -f /usr/local/greenplum-db-5/hostsfile
 gpinitsystem -a -c  /tmp/configs/gpinitsystem_singlenode -h /usr/local/greenplum-db-5/hostsfile
 #cat /home/gpadmin/gpAdminLogs/gpinit*
 echo "INSTALLED"
 # gpstart -a
 createdb gpadmin
 #gpstop -M smart
}
tutorial_repo(){
        git clone --depth=1 https://github.com/Pivotal-Open-Source-Hub/gpdb-sandbox-tutorials.git /home/gpadmin/gpdb-sandbox-tutorials
}




_main() {
	install_gpdb
	tutorial_repo

}



_main "$@"
