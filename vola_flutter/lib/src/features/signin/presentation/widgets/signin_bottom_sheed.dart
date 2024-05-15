import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:serverpod_auth_client/module.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:vola_flutter/src/config/values/colors.dart';
import 'package:vola_flutter/src/config/values/sizes.dart';
import 'package:vola_flutter/src/utils/helpers/helper_functions.dart';

const _defaultMaxPasswordLength = 128;
const _defaultMinPasswordLength = 8;

enum _Page {
  signIn,
  createAccount,
  confirmEmail,
  forgotPassword,
  confirmPasswordReset,
}

/// A bottomsheet for signing in with email and password.
class SignInWithEmailSheed extends StatefulWidget {
  /// A reference to the auth module as retrieved from the client object.
  final Caller caller;

  /// Callback that is called when the user has successfully signed in.
  final VoidCallback onSignedIn;

  /// The maximum length of the password.
  final int maxPasswordLength;

  /// The minimum length of the password.
  final int minPasswordLength;

  /// Creates a new sign in with email dialog.
  const SignInWithEmailSheed({
    super.key,
    required this.caller,
    required this.onSignedIn,
    this.maxPasswordLength = _defaultMaxPasswordLength,
    this.minPasswordLength = _defaultMinPasswordLength,
  });

  @override
  SignInWithEmailSheedState createState() => SignInWithEmailSheedState();
}

/// State for the sign in with email botomsheet.
class SignInWithEmailSheedState extends State<SignInWithEmailSheed> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _validationCodeController =
      TextEditingController();

  String? _userNameIssue;
  String? _emailIssue;
  String? _passwordIssue;
  String? _validationCodeIssue;

  late final EmailAuthController _emailAuth;

  _Page _page = _Page.signIn;

  bool _enabled = true;

  @override
  void initState() {
    super.initState();
    _emailAuth = EmailAuthController(widget.caller);
  }

  @override
  Widget build(BuildContext context) {
    final isDark = VHelperFunctions.isDarkMode(context);

    List<Widget> widgets;

    if (_page == _Page.createAccount) {
      widgets = [
        SimpleShadow(
          child: TextField(
            enabled: _enabled,
            controller: _usernameController,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              fillColor: isDark
                  ? Theme.of(context).colorScheme.inversePrimary
                  : Theme.of(context).colorScheme.onPrimary,
              hintText: 'vFieldUsername'.tr(),
              helperText: ' ',
              errorText: _userNameIssue,
            ),
            onChanged: (_) {
              setState(() {
                _userNameIssue = null;
              });
            },
          ),
        ),
        SimpleShadow(
          child: TextField(
            enabled: _enabled,
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              fillColor: isDark
                  ? Theme.of(context).colorScheme.inversePrimary
                  : Theme.of(context).colorScheme.onPrimary,
              hintText: 'vFieldEmail'.tr(),
              helperText: ' ',
              errorText: _emailIssue,
            ),
            onChanged: (_) {
              setState(() {
                _emailIssue = null;
              });
            },
          ),
        ),
        SimpleShadow(
          child: TextField(
            enabled: _enabled,
            controller: _passwordController,
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              fillColor: isDark
                  ? Theme.of(context).colorScheme.inversePrimary
                  : Theme.of(context).colorScheme.onPrimary,
              hintText: 'vPassField'.tr(),
              helperText: ' ',
              errorText: _passwordIssue,
            ),
            onChanged: (_) {
              setState(() {
                _passwordIssue = null;
              });
            },
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const SizedBox(
          height: 40,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: vPrimaryColor,
          ),
          onPressed: _enabled ? _createAccount : null,
          child: Text(
            'vButtonSignin'.tr(),
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: vLightColor,
                ),
          ),
        ),
        TextButton(
          onPressed: _enabled
              ? () {
                  setState(() {
                    _page = _Page.signIn;
                  });
                }
              : null,
          child: Text(
            'vIm_here'.tr(),
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: isDark ? vPrimaryColor : vSecondaryColor,
                ),
          ),
        ),
      ];
    } else if (_page == _Page.signIn) {
      widgets = [
        SimpleShadow(
          child: TextField(
            enabled: _enabled,
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              fillColor: isDark
                  ? Theme.of(context).colorScheme.inversePrimary
                  : Theme.of(context).colorScheme.onPrimary,
              hintText: 'vFieldEmail'.tr(),
              helperText: ' ',
              errorText: _emailIssue,
            ),
            onChanged: (_) {
              setState(() {
                _emailIssue = null;
              });
            },
          ),
        ),
        SimpleShadow(
          child: TextField(
            enabled: _enabled,
            controller: _passwordController,
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              fillColor: isDark
                  ? Theme.of(context).colorScheme.inversePrimary
                  : Theme.of(context).colorScheme.onPrimary,
              hintText: 'vPassField'.tr(),
              helperText: ' ',
              errorText: _passwordIssue,
            ),
            onChanged: (_) {
              setState(() {
                _passwordIssue = null;
              });
            },
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: vPrimaryColor,
          ),
          onPressed: _enabled ? _signIn : null,
          child: Text(
            'vButtonLogin'.tr(),
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: vLightColor,
                ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                setState(() {
                  _page = _Page.forgotPassword;
                });
              },
              child: Text(
                "vForgotPass".tr(),
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: isDark ? vPrimaryColor : vSecondaryColor,
                    ),
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: _enabled
                  ? () {
                      setState(() {
                        _page = _Page.createAccount;
                      });
                    }
                  : null,
              child: Text(
                "vCreateAccount".tr(),
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: isDark ? vPrimaryColor : vSecondaryColor,
                    ),
              ),
            ),
          ],
        ),
      ];
    } else if (_page == _Page.forgotPassword) {
      widgets = [
        SimpleShadow(
          child: TextField(
            enabled: _enabled,
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              fillColor: isDark
                  ? Theme.of(context).colorScheme.inversePrimary
                  : Theme.of(context).colorScheme.onPrimary,
              hintText: 'vFieldEmail'.tr(),
              helperText: ' ',
              errorText: _emailIssue,
            ),
            onChanged: (_) {
              setState(() {
                _emailIssue = null;
              });
            },
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: vPrimaryColor,
          ),
          onPressed: _enabled ? _initiatePasswordReset : null,
          child: Text(
            'vResetPass'.tr(),
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: vLightColor,
                ),
          ),
        ),
        TextButton(
          onPressed: _enabled
              ? () {
                  setState(() {
                    _page = _Page.signIn;
                  });
                }
              : null,
          child: Text(
            'vBack'.tr(),
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: isDark ? vPrimaryColor : vSecondaryColor,
                ),
          ),
        ),
      ];
    } else if (_page == _Page.confirmEmail) {
      widgets = [
        Text(
          'vSendresetMail',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: isDark ? vPrimaryColor : vSecondaryColor,
              ),
        ),
        const SizedBox(
          height: 16,
        ),
        SimpleShadow(
          child: TextField(
            enabled: _enabled,
            controller: _validationCodeController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              fillColor: isDark
                  ? Theme.of(context).colorScheme.inversePrimary
                  : Theme.of(context).colorScheme.onPrimary,
              hintText: 'vFieldEmail'.tr(),
              helperText: ' ',
              errorText: _validationCodeIssue,
            ),
            onChanged: (_) {
              setState(() {
                _passwordIssue = null;
              });
            },
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: vPrimaryColor,
          ),
          onPressed: _enabled ? _validateAccount : null,
          child: Text(
            'vButtonSignin'.tr(),
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: vLightColor,
                ),
          ),
        ),
        TextButton(
          onPressed: _enabled
              ? () {
                  setState(() {
                    _page = _Page.signIn;
                  });
                }
              : null,
          child: Text(
            'vBack'.tr(),
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: isDark ? vPrimaryColor : vSecondaryColor,
                ),
          ),
        ),
      ];
    } else if (_page == _Page.confirmPasswordReset) {
      widgets = [
        Text(
          'vSendCode',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: isDark ? vPrimaryColor : vSecondaryColor,
              ),
        ),
        const SizedBox(
          height: 16,
        ),
        SimpleShadow(
          child: TextField(
            enabled: _enabled,
            controller: _validationCodeController,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              fillColor: isDark
                  ? Theme.of(context).colorScheme.inversePrimary
                  : Theme.of(context).colorScheme.onPrimary,
              hintText: 'vValiCode'.tr(),
              helperText: ' ',
              errorText: _validationCodeIssue,
            ),
            onChanged: (_) {
              setState(() {
                _passwordIssue = null;
              });
            },
          ),
        ),
        SimpleShadow(
          child: TextField(
            enabled: _enabled,
            maxLength: widget.maxPasswordLength,
            controller: _passwordController,
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              fillColor: isDark
                  ? Theme.of(context).colorScheme.inversePrimary
                  : Theme.of(context).colorScheme.onPrimary,
              hintText: 'vNewPass'.tr(),
              helperText: ' ',
              errorText: _passwordIssue,
            ),
            onChanged: (_) {
              setState(() {
                _passwordIssue = null;
              });
            },
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        ElevatedButton(
          onPressed: _enabled ? _resetPassword : null,
          child: Text(
            'vButtonSignin'.tr(),
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                ),
          ),
        ),
        TextButton(
          onPressed: _enabled
              ? () {
                  setState(() {
                    _page = _Page.signIn;
                  });
                }
              : null,
          child: Text(
            'vBack'.tr(),
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: isDark ? vPrimaryColor : vSecondaryColor,
                ),
          ),
        ),
      ];
    } else {
      throw UnimplementedError('Unexpected state $_page');
    }
///////////////
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Container(
            height: 755,
            decoration: const BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 15,
                sigmaY: 15,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .secondaryContainer
                      .withOpacity(0.4),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                height: MediaQuery.of(context).size.height * 0.75,
                padding: const EdgeInsets.only(
                    top: Sizes.p48, left: Sizes.p12, right: Sizes.p12),
                child: SizedBox(
                  height: 400,
                  child: SizedBox(
                    height: 400,
                    child: SingleChildScrollView(
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: widgets,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 100,
          child: SizedBox(
            child: Text(
              'vlogin_sheed'.tr(),
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: vLightColor,
                  ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _createAccount() async {
    _resetIssues();
    var userName = _usernameController.text.trim();
    if (userName.isEmpty) {
      setState(() {
        _userNameIssue = 'Please enter a user name';
      });
      return;
    }

    var email = _emailController.text.trim().toLowerCase();
    if (!EmailValidator.validate(email)) {
      setState(() {
        _emailIssue = 'Invalid email';
      });
      return;
    }

    var password = _passwordController.text;
    if (password.length < widget.minPasswordLength) {
      setState(() {
        _passwordIssue = 'Minimum ${widget.minPasswordLength} characters';
      });
      return;
    }
    if (password.length > widget.maxPasswordLength) {
      setState(() {
        _passwordIssue = 'Maximum ${widget.maxPasswordLength} characters';
      });
      return;
    }

    setState(() {
      _enabled = false;
    });

    var success = await _emailAuth.createAccountRequest(
      userName,
      email,
      password,
    );

    setState(() {
      _enabled = true;

      if (success) {
        _page = _Page.confirmEmail;
      } else {
        _emailIssue = 'Email already in use';
      }
    });
  }

  Future<void> _validateAccount() async {
    _resetIssues();
    if (_validationCodeController.text.isEmpty) {
      setState(() {
        _validationCodeIssue = 'Enter your code';
      });
      return;
    }
    var email = _emailController.text.toLowerCase().trim();

    setState(() {
      _enabled = false;
    });

    var userInfo = await _emailAuth.validateAccount(
      email,
      _validationCodeController.text,
    );

    if (userInfo == null) {
      setState(() {
        _validationCodeIssue = 'Incorrect code';
        _enabled = true;
      });
      return;
    }

    // We've setup the account, sign in!
    var result = await _emailAuth.signIn(email, _passwordController.text);
    if (result == null) {
      // Something went wrong, start over
      setState(() {
        _page = _Page.createAccount;
        _enabled = true;
      });
      return;
    }

    // Pop dialog
    if (mounted) {
      Navigator.of(context).pop();
    }
    widget.onSignedIn();
  }

  Future<void> _signIn() async {
    _resetIssues();
    var email = _emailController.text.trim().toLowerCase();
    if (!EmailValidator.validate(email)) {
      setState(() {
        _emailIssue = 'Invalid email';
      });
      return;
    }

    var password = _passwordController.text;
    if (password.length < widget.minPasswordLength) {
      setState(() {
        _passwordIssue = 'Minimum ${widget.minPasswordLength} characters';
      });
      return;
    }

    setState(() {
      _enabled = false;
    });

    var result = await _emailAuth.signIn(email, password);
    if (result == null) {
      // Something went wrong, start over
      setState(() {
        _passwordIssue = 'Incorrect password';
        _enabled = true;
      });
      return;
    }

    // Pop dialog
    if (mounted) {
      Navigator.of(context).pop();
    }
    widget.onSignedIn();
  }

  Future<void> _initiatePasswordReset() async {
    _resetIssues();
    var email = _emailController.text.trim().toLowerCase();
    if (!EmailValidator.validate(email)) {
      setState(() {
        _emailIssue = 'Invalid email';
      });
      return;
    }

    setState(() {
      _enabled = false;
    });

    await _emailAuth.initiatePasswordReset(email);

    setState(() {
      _page = _Page.confirmPasswordReset;
      _enabled = true;
    });
  }

  Future<void> _resetPassword() async {
    _resetIssues();
    if (_passwordController.text.length < 8) {
      setState(() {
        _passwordIssue = 'Min 8 characters';
      });
      return;
    }

    var email = _emailController.text.trim().toLowerCase();

    setState(() {
      _enabled = false;
    });

    var success = await _emailAuth.resetPassword(
      email,
      _validationCodeController.text,
      _passwordController.text,
    );

    if (!success) {
      setState(() {
        _validationCodeIssue = 'Incorrect code';
        _enabled = true;
      });
      return;
    }

    var result = await _emailAuth.signIn(email, _passwordController.text);
    if (result == null) {
      // Something went wrong, start over
      setState(() {
        _resetTextFields();
        _page = _Page.signIn;
        _enabled = true;
      });
      return;
    }

    // Pop dialog
    if (mounted) {
      Navigator.of(context).pop();
    }
    widget.onSignedIn();
  }

  void _resetIssues() {
    setState(() {
      _emailIssue = '';
      _passwordIssue = '';
      _validationCodeIssue = '';
      _userNameIssue = '';
    });
  }

  void _resetTextFields() {
    setState(() {
      _validationCodeController.text = '';
      _passwordController.text = '';
      _emailController.text = '';
      _usernameController.text = '';
    });
  }
}

/// Shows a dialog that allows the user to sign in with email.
void showSignInEmailSheed({
  required BuildContext context,
  required Caller caller,
  required VoidCallback onSignedIn,
  int? maxPasswordLength,
  int? minPasswordLength,
}) {
  showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) {
      return SignInWithEmailSheed(
        caller: caller,
        onSignedIn: onSignedIn,
        maxPasswordLength: maxPasswordLength ?? _defaultMaxPasswordLength,
        minPasswordLength: minPasswordLength ?? _defaultMinPasswordLength,
      );
    },
  );
}
