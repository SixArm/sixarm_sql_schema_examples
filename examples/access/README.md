# Access

This access control schema group provides models that you can customize as you like for attribute based access control (ABAC)
or role based access control (RBAC).

* User - such as "Alice". You may prefer to use your own user table, or person table, or account table.

* Assigment - such as "Alice is an administrator"

* Attribute - such as "administrator". If you prefer to change from ABAC to RBAC, then rename this table from "attribute" to "role".

* Permission - such as as "The administrator role has permission to edit data".

* Operation - such as "edit data".

If you want to use ABAC, then a typical model is this:

```text
User ← Assgiment → Attribute ← Permission → Operation
```

If you want to use RBAC, then a typical model is this:

```text
User ← Assignment → Role ← Permission → Operation
```
