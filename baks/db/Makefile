#### @martysama0134 backup scripts ####
### Inside /etc/crontab paste:
## for automatic backups every hour:
# 0	*	*	*	*	root	make -C /home/metin2/baks/db dump
## for automatic clean of backups older than 7 days every week:
# 0	0	*	*	1	root	make -C /home/metin2/baks/db wclean

DATE != date +%Y%m%d-%H%M%S

MY_HOST = localhost
MY_USER = root
MY_PASS = password
MY_LOGF = log.txt
PREFIX = srv1_
OUTPATH = .

all:
	@echo "available all, dump, recovery, clean, lclean, wclean, cleanall"
	@echo "TEST: -u $(MY_USER) -p$(MY_PASS) -h $(MY_HOST) > $(PREFIX)$(DATE).sql"

dump:
	@echo "### dump begin $(DATE)" >> $(MY_LOGF)
	@mkdir $(DATE)/
	@/usr/local/bin/mysqldump --set-gtid-purged=OFF -u $(MY_USER) -p$(MY_PASS) -h $(MY_HOST) $(PREFIX)account | gzip -9 > $(OUTPATH)/$(DATE)/$(PREFIX)account.sql.gz 2>> $(MY_LOGF)
	@/usr/local/bin/mysqldump --set-gtid-purged=OFF -u $(MY_USER) -p$(MY_PASS) -h $(MY_HOST) $(PREFIX)common | gzip -9 > $(OUTPATH)/$(DATE)/$(PREFIX)common.sql.gz 2>> $(MY_LOGF)
	@/usr/local/bin/mysqldump --set-gtid-purged=OFF -u $(MY_USER) -p$(MY_PASS) -h $(MY_HOST) $(PREFIX)player | gzip -9 > $(OUTPATH)/$(DATE)/$(PREFIX)player.sql.gz 2>> $(MY_LOGF)
	@/usr/local/bin/mysqldump --set-gtid-purged=OFF --no-data -u $(MY_USER) -p$(MY_PASS) -h $(MY_HOST) $(PREFIX)log | gzip -9 > $(OUTPATH)/$(DATE)/$(PREFIX)log.sql.gz 2>> $(MY_LOGF)
	@/usr/local/bin/mysqldump --set-gtid-purged=OFF -u $(MY_USER) -p$(MY_PASS) -h $(MY_HOST) mysql | gzip -9 > $(OUTPATH)/$(DATE)/mysql.sql.gz 2>> $(MY_LOGF)
	@echo "### dump end $(DATE)" >> $(MY_LOGF)

recovery:
	@echo "### recovery begin $(DATE)" >> $(MY_LOGF)
	@gunzip < mysql.sql.gz | mysql -u $(MY_USER) -p$(MY_PASS) -h $(MY_HOST) mysql 2>> $(MY_LOGF)
	@gunzip < $(PREFIX)account.sql.gz | mysql -u $(MY_USER) -p$(MY_PASS) -h $(MY_HOST) $(PREFIX)account 2>> $(MY_LOGF)
	@gunzip < $(PREFIX)common.sql.gz | mysql -u $(MY_USER) -p$(MY_PASS) -h $(MY_HOST) $(PREFIX)common 2>> $(MY_LOGF)
	@gunzip < $(PREFIX)player.sql.gz | mysql -u $(MY_USER) -p$(MY_PASS) -h $(MY_HOST) $(PREFIX)player 2>> $(MY_LOGF)
	@gunzip < $(PREFIX)log.sql.gz | mysql -u $(MY_USER) -p$(MY_PASS) -h $(MY_HOST) $(PREFIX)log 2>> $(MY_LOGF)
	@echo "### recovery end $(DATE)" >> $(MY_LOGF)

clean:
	@find $(OUTPATH) ! -name Makefile ! -name $(OUTPATH) -exec rm -rf {} +

lclean:
	@cat /dev/null > $(MY_LOGF)

wclean:
	@echo "### clean week begin $(DATE)" >> $(MY_LOGF)
	@find $(OUTPATH) ! -name Makefile ! -name $(OUTPATH) -type d -mtime +7 -print -exec rm -rf {} + >> $(MY_LOGF)
	@echo "### clean week end $(DATE)" >> $(MY_LOGF)

cleanall: clean lclean
	@echo "### clean all done $(DATE)" >> $(MY_LOGF)



