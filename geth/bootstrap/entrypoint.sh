#!/bin/sh

sealer1=$(getent hosts geth-sealer-1 | awk '{print $1}')
sealer2=$(getent hosts geth-sealer-2 | awk '{print $1}')
sealer3=$(getent hosts geth-sealer-3 | awk '{print $1}')

echo "[" > /static-nodes.json
echo "  \"enode://37a9661a1c23d010edccf29ae8670c714d93faa009b3d2ba606b772eaf6d01f0880bb864f45bcf391aad118d35b7f57756e696aee5850848b2f73335114a6aff@${sealer1}:30303\"," >> /static-nodes.json
echo "  \"enode://1cdb0de42c3c3f2c566891b760701a70e56b62582e02931fc38b23d1f1988d3bbb28b835ffeb8645d995cedea5943acd7763e1bb02241d70ef3c00825a558322@${sealer2}:30303\"," >> /static-nodes.json
echo "  \"enode://8ea73992287a0875ded4f9b3f94cb438b3bed0ee7698aaf8de05a85a436366229a5c610328e30d8ae0dba264f772dae2b22dde751570e3d5d1f9de438da53017@${sealer3}:30303\"" >> /static-nodes.json
echo "]" >> /static-nodes.json

cat /static-nodes.json