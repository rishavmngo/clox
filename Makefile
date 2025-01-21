CC = gcc
CFLAGS = -Wall
DEBUG_FLAGS = -g
TARGET_DIR = target
TARGET = $(TARGET_DIR)/clox

# Source and Object Files
SRCS = $(wildcard *.c)
OBJS = $(patsubst %.c,$(TARGET_DIR)/%.o,$(SRCS))

# Optional Debug Build
ifdef DEBUG
    CFLAGS += $(DEBUG_FLAGS)
endif

# Default Target
all: $(TARGET)

# Build Target
$(TARGET): $(OBJS)
	@mkdir -p $(TARGET_DIR)
	$(CC) $(CFLAGS) -o $@ $^

# Object Files
$(TARGET_DIR)/%.o: %.c
	@mkdir -p $(TARGET_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

# Clean Build
clean:
	rm -rf $(TARGET_DIR)

# Phony Targets
.PHONY: all clean
