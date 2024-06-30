#### @martysama0134 backup scripts ####
### Inside /etc/crontab paste:
## for automatic backups every hour:
# 0	*	*	*	*	root	make -C /home/metin2/baks/db-rev dump

DATE != date +%Y%m%d-%H%M%S

MY_HOST = localhost
MY_USER = root
MY_PASS = password
MY_LOGF = /dev/null #log.txt
PREFIX = srv1_
ACCOUNT_TABLES = block_exception GameTime GameTimeIP iptocountry string
PLAYER_TABLES = banword item_attr item_attr_rare item_proto land mob_proto object_proto refine_proto shop shop_item skill_proto string
OUTPATH = .

all:
	@echo "available all, dump, recovery, clean, lclean, cleanall"
	@echo "TEST: -u $(MY_USER) -p$(MY_PASS) -h $(MY_HOST) > $(PREFIX)$(DATE).sql"

dump:
	@echo "### dump begin $(DATE)" >> $(MY_LOGF)
	@### struct only
	@/usr/local/bin/mysqldump --no-data --skip-extended-insert --skip-dump-date -u $(MY_USER) -p$(MY_PASS) -h $(MY_HOST) $(PREFIX)account > $(OUTPATH)/$(PREFIX)account-schema.sql 2>> $(MY_LOGF)
	@/usr/local/bin/mysqldump --no-data --skip-extended-insert --skip-dump-date -u $(MY_USER) -p$(MY_PASS) -h $(MY_HOST) $(PREFIX)common > $(OUTPATH)/$(PREFIX)common-schema.sql 2>> $(MY_LOGF)
	@/usr/local/bin/mysqldump --no-data --skip-extended-insert --skip-dump-date -u $(MY_USER) -p$(MY_PASS) -h $(MY_HOST) $(PREFIX)player > $(OUTPATH)/$(PREFIX)player-schema.sql 2>> $(MY_LOGF)
	@/usr/local/bin/mysqldump --no-data --skip-extended-insert --skip-dump-date -u $(MY_USER) -p$(MY_PASS) -h $(MY_HOST) $(PREFIX)log > $(OUTPATH)/$(PREFIX)log-schema.sql 2>> $(MY_LOGF)
	@### data only
	@/usr/local/bin/mysqldump --no-create-info --skip-extended-insert --skip-dump-date -u $(MY_USER) -p$(MY_PASS) -h $(MY_HOST) $(PREFIX)account $(ACCOUNT_TABLES) > $(OUTPATH)/$(PREFIX)common-data.sql 2>> $(MY_LOGF)
	@/usr/local/bin/mysqldump --no-create-info --skip-extended-insert --skip-dump-date -u $(MY_USER) -p$(MY_PASS) -h $(MY_HOST) $(PREFIX)common > $(OUTPATH)/$(PREFIX)common-data.sql 2>> $(MY_LOGF)
	@/usr/local/bin/mysqldump --no-create-info --skip-extended-insert --skip-dump-date -u $(MY_USER) -p$(MY_PASS) -h $(MY_HOST) $(PREFIX)player $(PLAYER_TABLES) > $(OUTPATH)/$(PREFIX)player-data.sql 2>> $(MY_LOGF)
	@echo "### dump end $(DATE)" >> $(MY_LOGF)

recovery:
	@echo "### recovery begin $(DATE)" >> $(MY_LOGF)
	@# schema
	@mysql -u $(MY_USER) -p$(MY_PASS) -h $(MY_HOST) $(PREFIX)account 2>> $(MY_LOGF) < $(OUTPATH)/$(PREFIX)account-schema.sql
	@mysql -u $(MY_USER) -p$(MY_PASS) -h $(MY_HOST) $(PREFIX)common 2>> $(MY_LOGF) < $(OUTPATH)/$(PREFIX)common-schema.sql
	@mysql -u $(MY_USER) -p$(MY_PASS) -h $(MY_HOST) $(PREFIX)log 2>> $(MY_LOGF) < $(OUTPATH)/$(PREFIX)log-schema.sql
	@mysql -u $(MY_USER) -p$(MY_PASS) -h $(MY_HOST) $(PREFIX)player 2>> $(MY_LOGF) < $(OUTPATH)/$(PREFIX)player-schema.sql
	@# data
	@mysql -u $(MY_USER) -p$(MY_PASS) -h $(MY_HOST) $(PREFIX)account 2>> $(MY_LOGF) < $(OUTPATH)/$(PREFIX)account-data.sql
	@mysql -u $(MY_USER) -p$(MY_PASS) -h $(MY_HOST) $(PREFIX)common 2>> $(MY_LOGF) < $(OUTPATH)/$(PREFIX)common-data.sql
	@# @mysql -u $(MY_USER) -p$(MY_PASS) -h $(MY_HOST) $(PREFIX)log 2>> $(MY_LOGF) < $(OUTPATH)/$(PREFIX)log-data.sql
	@mysql -u $(MY_USER) -p$(MY_PASS) -h $(MY_HOST) $(PREFIX)player 2>> $(MY_LOGF) < $(OUTPATH)/$(PREFIX)player-data.sql
	@echo "### recovery end $(DATE)" >> $(MY_LOGF)

clean:
	@rm -f $(OUTPATH)/*.sql

lclean:
	@cat /dev/null > $(MY_LOGF)

cleanall: clean lclean
	@echo "### clean all done $(DATE)" >> $(MY_LOGF)
