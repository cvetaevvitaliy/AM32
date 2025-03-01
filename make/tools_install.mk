# rules to download and install the tools for windows and linux

# download location for tools
WINDOWS_TOOLS=https://firmware.ardupilot.org/Tools/AM32-tools/windows-tools.zip
LINUX_TOOLS=https://firmware.ardupilot.org/Tools/AM32-tools/linux-tools.tar.gz

ifeq ($(OS),Windows_NT)

arm_sdk_install:
	@echo Installing windows tools
	@echo downloading windows-tools.zip
	@powershell -Command "& { (New-Object System.Net.WebClient).DownloadFile('$(WINDOWS_TOOLS)', 'windows-tools.zip') }"
	@echo unpacking windows-tools.zip
	@powershell -Command "Expand-Archive -Path windows-tools.zip -Force -DestinationPath ."
	@echo windows tools install done

else

arm_sdk_install:
	@echo Installing linux tools
	@wget $(LINUX_TOOLS)
	@tar xzf linux-tools.tar.gz
	@echo linux tools install done

endif
