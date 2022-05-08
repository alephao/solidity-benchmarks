# Pattern: <CONTRACT>_<VARIANT>_<method>_Test:test_<method>_<optionalConstraint>_<optionalData>() (gas: <gas>)
# Example: ERC721_B_transfer_Test:test_transfer_toNonOwner_id50() (gas: 179836)

import re
import json

regex = re.compile(
    r"(?P<contract>.+?)_(?P<variant>.+?)_(?P<method1>.+?)_Test:test_(?P<method2>.+?)(_(?P<constraint>.+?))?\(.+?(?P<gas>\d+)")


def main():
    obj = {}

    versions = [
        "0.8.10",
        "0.8.11",
        "0.8.12",
        "0.8.13",
    ]

    for version in versions:
        snapshot_file = "{}.gas-snapshot".format(version.replace(".", "-"))
        snapshot = open(snapshot_file, "r")
        lines = snapshot.readlines()

        for line in lines:
            match = regex.match(line)

            groupdict = match.groupdict()
            contract = groupdict["contract"]
            variant = groupdict["variant"]
            method1 = groupdict["method1"]
            # method2 = groupdict["method2"]
            constraint = groupdict["constraint"]
            gas = groupdict["gas"]

            if not (contract in obj):
                obj[contract] = {}

            if not (version in obj[contract]):
                obj[contract][version] = {}

            if not (method1 in obj[contract][version]):
                obj[contract][version][method1] = {}

            if not (variant in obj[contract][version][method1]):
                obj[contract][version][method1][variant] = {}

            if constraint:
                obj[contract][version][method1][variant][constraint] = gas
            else:
                obj[contract][version][method1][variant] = gas

    json_dump = json.dumps(obj, indent=2)
    f = open("data.json", "w")
    f.write(json_dump)

main()
