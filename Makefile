SRC_DIR := src
BUILD_DIR := build
STYLE_SRC := styles/custom.css
STYLE_DEST := $(BUILD_DIR)/custom.css

SRC_FILES := $(wildcard $(SRC_DIR)/*.adoc)
HTML_FILES := $(patsubst $(SRC_DIR)/%.adoc,$(BUILD_DIR)/%.html,$(SRC_FILES))

all: $(HTML_FILES) $(STYLE_DEST)

$(BUILD_DIR)/%.html: $(SRC_DIR)/%.adoc
	@mkdir -p $(BUILD_DIR)
	asciidoctor -a stylesheet=custom.css -a stylesdir=. -a linkcss -o $@ $<

$(STYLE_DEST): $(STYLE_SRC)
	@mkdir -p $(BUILD_DIR)
	cp $< $@

clean:
	rm -rf $(BUILD_DIR)

.PHONY: all clean
