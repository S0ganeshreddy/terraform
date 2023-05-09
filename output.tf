output "lb_dns_name" {
  description = "URL of load balancer"
  value       = aws_lb.aplb.dns_name
}
