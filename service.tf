resource "aws_ecs_service" "def_svc" {
  name            = "http-server"                             # Naming our first service
  cluster         = "${aws_ecs_cluster.def.id}"             # Referencing our created Cluster
  task_definition = "${aws_ecs_task_definition.def.arn}" # Referencing the task our service will spin up
  launch_type     = "FARGATE"
  desired_count   = 2 # Setting the number of containers we want deployed to 3

  load_balancer {
    target_group_arn = "${aws_lb_target_group.ecs_target_group.arn}" # Referencing our target group
    container_name   = "${aws_ecs_task_definition.def.family}"
    container_port   = 80 # Specifying the container port
  }

  network_configuration {
    subnets          = ["${aws_default_subnet.def_a.id}", "${aws_default_subnet.def_b.id}", "${aws_default_subnet.def_c.id}"]
    assign_public_ip = true # Providing our containers with public IPs
  }
}