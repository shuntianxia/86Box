#/*
#*********************************************************************************************************
#*                                                    MELIS
#*                                    the Easy Portable/Player Develop Kits
#*                                               makefile Module
#*
#*                                    (c) Copyright 2006-2010, kevin.z China
#*                                             All Rights Reserved
#*
#* File    : makefile
#* By      : kevin.z
#* Version : v1.0
#* Date    : 2010-9-3 9:39
#* Descript:
#* Update  : date                auther      ver     notes
#*********************************************************************************************************
#*/


#�������������
include make.cfg


#��������Ŀ¼�еõ�Դ������б�
SRCCS=$(foreach dir,$(SRCDIRS),$(wildcard $(dir)/*.c))
SRCSS=$(foreach dir,$(SRCDIRS),$(wildcard $(dir)/*.s))

#�õ�Դ�����Ӧ��Ŀ���ļ����б�
OBJS=$(SRCCS:.c=.o) $(SRCSS:.s=.o)


#�������Ŀ���ļ�
all:$(LOCALTARGET)
	$(LOAD) $(LDFLAGS) $(TARGET) $(LOCALTARGET)
	@echo ----------------------------
	@echo Application make finish
	@echo ----------------------------

#���ɱ���Ŀ���ļ�
$(LOCALTARGET):$(OBJS)
	$(LINK) $(LKFLAGS) -o $@ $(filter %.o ,$+) $(LIBS)


# ɾ�����ɵ��м��ļ�
clean:
	find ./ -name "*.o" | xargs rm -rf
	-rm $(LOCALTARGET)
	@echo ----------------------------
	@echo Application clean up
	@echo ----------------------------