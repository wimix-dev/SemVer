
public extension Version {
    init?(_ string: String) {
        let components = string.split(separator: ".")
        guard !components.isEmpty, components.count < 4 else {
            return nil
        }

        guard let majorString = components.first, let major = Int(majorString) else {
            return nil
        }

        let minor: Int
        if let minorString = components.dropFirst().first {
            guard let minorValue = Int(minorString) else {
                return nil
            }
            minor = minorValue
        } else {
            minor = 0
        }

        let patch: Int
        if let patchString = components.dropFirst().dropFirst().first {
            guard let patchValue = Int(patchString) else {
                return nil
            }
            patch = patchValue
        } else {
            patch = 0
        }

        self.init(major: major, minor: minor, patch: patch)
    }
}

extension Version: CustomStringConvertible {
    public var description: String {
        String(self)
    }
}

public extension String {
    init(_ version: Version) {
        self.init("\(version.major).\(version.minor).\(version.patch)")
    }
}
