# Authentication

!!! summary
		accessing the REST API securely

## Reasoning

At a minimum SSH Keys are used for remote access to most _Linux_ cloud servers. YubiKey's and Citrix tokens are also used for accessing various levels of secure systems. Additionally, most container orchestration platforms enable multiple levels of API access.

In creating a platform to support _any_ containerization backend, constraints fall into the lowest common denominator. Yet the lowest common denominator must be secure, if not more secure than the actual backend API.

Additionally the approach should be capable of being automated, work with existing secure key vaults and if compromised (via BASH history) reduce exposure to commands that would be denied if re-executed against the API.

## Approach

… used in _Cyvive.io_ is MultiFactorAuthentication (MFA). Its the only current technology that satisfies the requirements mentioned in _reasoning_.

Specifically _Cyvive.io_ uses the [Authenticator](https://www.npmjs.com/package/authenticator) NPM module internally. There is a [CLI Version](https://www.npmjs.com/package/authenticator-cli) available for use as well.

This approach ensures that even if the BASH history were retrieved all access tokens would have been invalidated as the current industry approach to MFA is:

* tokens are generated every 30 seconds
* tokens live a maximum of 90 seconds before invalidation occurs

Additional reading in favour of MFA and its benefits over a password based approach can be investigated [here](https://medium.com/@ninjudd/passwords-are-obsolete-9ed56d483eb)
