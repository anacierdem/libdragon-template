V=1
SOURCE_DIR=src
BUILD_DIR=build
include $(N64_INST)/include/n64.mk

.PHONY: all
all: hello.z64 libdragon-install

OBJS = $(BUILD_DIR)/main.o

hello.z64: N64_ROM_TITLE="Hello World"

$(BUILD_DIR)/hello.elf: $(OBJS)

.PHONY: clean
clean:
	rm -f $(BUILD_DIR)/* *.z64

.PHONY: libdragon-install
libdragon-install:
	$(MAKE) -C ./libdragon install SOURCE_DIR=$(CURDIR)/libdragon/src

-include $(wildcard $(BUILD_DIR)/*.d)