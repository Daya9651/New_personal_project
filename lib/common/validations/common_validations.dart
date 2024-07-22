class Validators {
  static String? validateName(value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  static String? validateEmail(value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    } else if (!value.contains('@')) {
      return 'Enter a valid email address';
    }
    return null;
  }

  static String? validateMobile(value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
      // ConstToast.to.showError("Customer Number is required");
      // return null;
    } else if (value.length != 10) {
      // ConstToast.to.showError("Enter a valid 10-digit mobile number");
      return 'Enter a valid 10-digit mobile number';
    } else if (value.startsWith(RegExp('[1-5]'))) {
      return 'Enter a valid mobile number';
      // ConstToast.to.showError("Enter a valid  mobile number");
    }
    else if (int.tryParse(value) == null) {
      return 'Enter a valid numeric mobile number';
      // ConstToast.to.showError("Enter a valid  mobile number");
    }
    return null;
  }

  static String? validateQty(value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
      // ConstToast.to.showError("Please Enter Qty");
      // return null;
    }

    // Check if the value can be parsed as an integer
    int? quantity = int.tryParse(value);
    if (quantity == null) {
      return 'Enter a valid numeric quantity';
      // ConstToast.to.showError("Enter a valid numeric quantity");
      // return null;
    }

    // Check if the quantity is positive
    if (quantity <= 0) {
      return 'Enter a positive quantity';
      // ConstToast.to.showError("Enter a positive quantity");
      // return null;

    }

    // Quantity is valid
    return null;
  }

  static String? validateAadhaar(value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    } else if (value.length != 12) {
      return 'Enter a valid 12-digit aadhaar number';
    } else if (value.startsWith(RegExp('[a-z]'))) {
      return 'Enter a valid aadhaar number';
    }
    else if (int.tryParse(value) == null) {
      return 'Enter a valid numeric aadhaar number';
    }
    return null;
  }

  static String? validatePAN(value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    } else if (value.length != 10) {
      return 'Enter a valid 10-character PAN number';
    } else if (!RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]$').hasMatch(value)) {
      return 'Enter a valid PAN number';
    }
    return null;
  }

  static String? validateGSTNumber(value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    } else if (value.length != 15) {
      return 'Enter a valid 15-character GST number';
    } else
    if (!RegExp(r"^\d{2}[A-Z]{5}\d{4}[A-Z][A-Z\d]{3}$").hasMatch(value)) {
      return 'Enter a valid GST number';
    }
    return null;
  }

  static String? validatePinCode(value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    } else if (value.length != 6) {
      return 'Enter a valid pincode';
    }
    else if (int.tryParse(value) == null) {
      return 'Enter a valid numeric  number';
    }
    return null;
  }


  static String? validateCompanyName(value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  static String? validateAddress(value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  static String? validateArea(value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  static String? validateBankName(value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }

    return null;
  }

  static String? validateBranch(value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  static String? validateAccountNumber(value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    else if (int.tryParse(value) == null) {
      return 'Enter a valid numeric  number';
    }
    return null;
  }

  static String? validateIFSCCode(value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  static String? validateDLNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'DL number is required';
    }

    // Regular expression pattern for DL number (example format: KA0120170000000)
    // This is a generic pattern, and DL numbers may vary by state
    RegExp regex = RegExp(r'^[A-Z]{2}\d{13}$');

    // Check if the value matches the pattern
    if (!regex.hasMatch(value)) {
      return 'Invalid DL number';
    }

    return null; // Return null if the value is valid
  }


}
