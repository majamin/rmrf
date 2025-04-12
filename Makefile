SRC_DIR := src
BUILD_DIR := build
STYLE := styles/custom.css

SRC_FILES := $(wildcard $(SRC_DIR)/*.adoc)
HTML_FILES := $(patsubst $(SRC_DIR)/%.adoc,$(BUILD_DIR)/%.html,$(SRC_FILES))

all: $(HTML_FILES)

$(BUILD_DIR)/%.html: $(SRC_DIR)/%.adoc $(STYLE)
	@mkdir -p $(BUILD_DIR)
	asciidoctor -a linkcss -o $@ $<

clean:
	rm -rf $(BUILD_DIR)

.PHONY: all clean
