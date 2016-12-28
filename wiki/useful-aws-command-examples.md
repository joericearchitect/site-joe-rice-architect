
## Useful AWS command-line examples

## Working with EC2

### Get list of all Instances

**Command** - aws ec2 describe-instances

**Example - list all instances - all fields - default format**

```
   aws ec2 describe-instances
```

**Example - list all instances - only instanceid and tags fields - text format**

```
   aws ec2 describe-instances --query 'Reservations[*].Instances[*].{InstanceId:InstanceId,Tags:Tags}' --output text
```
