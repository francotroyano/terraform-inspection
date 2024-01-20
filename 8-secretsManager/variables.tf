# 6 types
# 3 primitives types -> number, string, bool
# 3 complex types -> list, map, set

variable "regions" {
  description = "AWS region"
  type        = list(string)
}