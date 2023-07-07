## Highlights

<table>
  <tr>
    <td align="left"><b>Key functionalities:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></td>
    <td><b>RESTful</b> web service + <b>CI</b></td>
  </tr>
  <tr>
    <td align="left"><b>Tech used:</b></td>
    <td align="right">Python, Django, PostgreSQL, Docker, Jenkins</td>
  </tr>
</table>

### [CI workflow diagram link](https://github.com/hanjustin/CI-Tools/blob/main/README.md#jenkins---repo-link)

## Getting Started

1. Clone the repo
```sh
git clone https://github.com/hanjustin/Poll-Web.git
```

2. Start Jenkins CI & Postgres
```sh
docker compose up
```

3. Create database tables
```sh
python manage.py migrate
```

4. Run
```sh
python manage.py runserver
```

5. Use the webservice XXXX

```
curl -XGET -H "Content-type: application/json" -d '{"name": "Justin", "username": "hanjustin"}' 'http://localhost:8080/api/users/'
```


## Running Jenkins and Postgres separately

`docker compose up` runs both Jenkins Postgres together. To run them separately, use the commands below:

### Jenkins

1. Build Jenkins image

```
docker build -t jenkinsimage .
```

2. Run the image in Docker

```
docker run --name jenkins -p 8080:8080 --env JENKINS_ADMIN_ID=admin --env JENKINS_ADMIN_PASSWORD=password jenkinsimage
```

### Postgres

```
docker run --name postgres-test -e POSTGRES_DB=djangoPostgreSQL -e POSTGRES_USER=mydatabaseuser -e POSTGRES_PASSWORD=mypassword -p 5433:5432 postgres
```

