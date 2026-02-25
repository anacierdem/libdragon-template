V=1
SOURCE_DIR=src
BUILD_DIR=build
include $(N64_INST)/include/n64.mk
include $(CURDIR)/tiny3d/t3d.mk

.PHONY: all
all: hello.z64

OBJS = $(BUILD_DIR)/main.o

hello.z64: N64_ROM_TITLE="Hello World" 
hello.z64: libdragon-install
$(BUILD_DIR)/hello.elf: $(OBJS) $(N64_INST)/mips64-elf/lib/libdragon.a $(N64_INST)/mips64-elf/lib/libdragonsys.a

.PHONY: clean
clean:
	rm -f $(BUILD_DIR)/* *.z64

.PHONY: libdragon-install
libdragon-install:
	$(MAKE) -C ./libdragon install SOURCE_DIR=$(CURDIR)/libdragon/src

-include $(wildcard $(BUILD_DIR)/*.d)