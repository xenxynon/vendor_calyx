# -----------------------------------------------------------------
# Calyx OTA update package

CALYX_OTA_PACKAGE := $(PRODUCT_OUT)/calyx-ota-$(TARGET_DEVICE)-$(CALYXOS_VERSION)-$(shell date +%H%M%S).zip

$(CALYX_OTA_PACKAGE): $(INTERNAL_OTA_PACKAGE_TARGET)
	$(hide) ln -f $(INTERNAL_OTA_PACKAGE_TARGET) $(CALYX_OTA_PACKAGE)
	@echo "Package Complete: $(CALYX_OTA_PACKAGE)" >&2

.PHONY: calyx-ota
calyx-ota: $(CALYX_OTA_PACKAGE) $(DEFAULT_GOAL)
