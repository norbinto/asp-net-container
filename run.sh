docker image build  -t asp-net-container:latest .                                                                  16:47:03
docker run -p 801:80 --name asp-net-container asp-net-container:latest
container-structure-test test --image asp-net-container:latest --config config.yaml