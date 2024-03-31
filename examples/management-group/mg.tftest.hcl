run "apply" {
  assert {
    condition     = length(var.management_group) == length(output.mg)
    error_message = "Modeule Failed"
  }
}