# -----------------------------------------------------------------
# Calyx OTA update package

CALYX_OTA_PACKAGE := $(PRODUCT_OUT)/calyx-ota-$(TARGET_DEVICE)-$(BUILD_NUMBER).zip

SHA256 := prebuilts/build-tools/path/$(HOST_PREBUILT_TAG)/sha256sum

$(CALYX_OTA_PACKAGE): $(INTERNAL_OTA_PACKAGE_TARGET)
	$(hide) ln -f $(INTERNAL_OTA_PACKAGE_TARGET) $(CALYX_OTA_PACKAGE)
	$(hide) $(SHA256) $(CALYX_OTA_PACKAGE) | sed "s|$(PRODUCT_OUT)/||" > $(CALYX_OTA_PACKAGE).sha256sum
	@echo "Package Complete: $(CALYX_OTA_PACKAGE)" >&2

.PHONY: calyx-ota
calyx-ota: $(CALYX_OTA_PACKAGE) $(DEFAULT_GOAL)
