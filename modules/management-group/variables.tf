variable "management_group" {
  type = list(object({
    parent           = optional(string, null)
    name             = string
    subscription_ids = optional(list(string), [])
  }))
  description = "List of Object for Management group creation"
}