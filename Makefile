DB=enceladus
BUILD=${CURDIR}/build.sql
SCRIPTS=${CURDIR}/scripts
CSV='${CURDIR}/data/master_plan.csv'
MASTER=$(SCRIPTS)/master.sql
NORMALIZE=$(SCRIPTS)/normalize.sql

BUILD_CDA=${CURDIR}/build_cda.sql
CDA_CSV='${CURDIR}/data/CDA/cda.csv'
CDA=${SCRIPTS}/cda.sql
CDA_IMPACTS=${SCRIPTS}/cda_impacts.sql


all: normalize
	psql $(DB) -f $(BUILD)

master:
	@cat $(MASTER) > $(BUILD)

import: master
	@echo "COPY import.master_plan FROM $(CSV) WITH DELIMITER ',' HEADER CSV;" >> $(BUILD)

normalize: import
	@cat $(NORMALIZE) >> $(BUILD)

clean:
	@rm -rf $(BUILD) $(BUILD_CDA)


cda: cda_impacts
	psql $(DB) -f $(BUILD_CDA)

cda_table:
	@cat $(CDA) > $(BUILD_CDA)

import_cda: cda_table
	@echo "COPY import.cda FROM $(CDA_CSV) WITH DELIMITER ',' HEADER CSV;" >> $(BUILD_CDA)

cda_impacts: import_cda
	@cat $(CDA_IMPACTS) >> $(BUILD_CDA)
