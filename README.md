# uno-rest-api

## Client

```bash
export api_url='http://localhost:9292/api'
uno.rb join john
uno.rb join peter
uno.rb join monica
```

```bash
uno.rb deal
```

```bash
uno.rb cards monica
```

```bash
uno.rb hands
```

```bash
uno.rb clear
```

## Elastic Beanstalk

This application can be deployed into AWS Elastic Beanstal, to do that, run the following command to generate a deploying package:

```bash
zip -r app_$(date +"%Y%m%d%H%M").zip Gemfile* app.rb config.ru server.rb
```

Before using the uno client, you have to export the `api_url` environment variable:

```bash
export api_url='http://your-public-dns-record/api-path' # if using HTTP
```
or

```bash
export api_url='https://your-public-dns-record/api-path' # if using HTTPS
```
