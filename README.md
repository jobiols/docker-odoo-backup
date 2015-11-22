# docker-odoo-backup
This image makes backup / restore of database and data per customer

## backup
This image will leave a dump of the database database-name and a tar of files from
the data_dir (filestore attach and session files of odoo). Each backup lives a pair of
files i.e. nixel_base_201511220005.tar nixel_base_201511220005.dump  

    sudo docker run --rm -i 
    --link postgres:db 
    --volumes-from clientname
    -v /your-backup-dir:/backup 
    --env DBNAME=database-name
    jobiols/odoo-backup backup


## restore
This image will restore a dump to a new database name, and restore the tar files to
its original place. new-database-name must not exist in database, and timestamp is 
the timestamp found in the file created from backup i.e. 201511220005

    sudo docker run --rm -i 
    --link postgres:db 
    --volumes-from clientname
    -v /your-backup-dir:/backup 
    --env NEW_DBNAME=new-database-name
    --env DATE=timestamp
    jobiols/odoo-backup backup
