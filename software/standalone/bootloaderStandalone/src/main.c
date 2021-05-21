#include "bootloaderStandaloneConfig.h"
#include "bsp.h"
#include "type.h"

void main() {
  bsp_init();
  bspMain();
}
