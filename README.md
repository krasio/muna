# Muna

> 1. (verb) (-ia) to talk privately.
> 2. (stative) be confidential, anonymous, secretly.
> 3. (noun) secret, confidentiality, secrecy.

Simple Rails app for encrypting secrets so that you can email then, post in Jira, etc...

## Deployment

Most important thing is to deploy and configure the app to work only for HTTPS requests. All that secrets encrypting stuff makes no sense otherwise.

## Configuration

#### Recipients

The application expects list of recipients (comma separated) as `MUNA_GPG_RECIPIENTS` environment variable or it will fail to boot.

#### Public keys

Recipients's public keys can be provided in the following ways:

* `MUNA_GPG_PUBLIC_KEYS` environment variable that contains one or more public keys.  
Example:  
```
MUNA_GPG_PUBLIC_KEYS=`cat gpg/*.pub`
```

* `MUNA_GPG_PUBLIC_KEYS_PATH` environment variable with the path to directory containing the public keys. Only file with `.pub` extension will be imported.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/krasio/muna. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The app is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Muna project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/qrasio/muna/blob/master/CODE_OF_CONDUCT.md).
