https://dmarcian.com/what-is-spf/
"_Sender Policy Framework (SPF) is used to authenticate the sender of an email. With an SPF record in place, Internet Service Providers can verify that a mail server is authorized to send email for a specific domain. An SPF record is a DNS TXT record containing a list of the IP addresses that are allowed to send email on behalf of your domain._"

***A visual workflow for SPF:***

![[Pasted image 20250723162511.png]]


## **How does a basic SPF record look like?**

`v=spf1 ip4:127.0.0.1 include:_spf.google.com -all`

An explanation for the above record:

- `v=spf1` -> This is the start of the SPF record
- `ip4:127.0.0.1` -> This specifies which IP (in this case version IP4 & not IP6) can send mail
- `include:_spf.google.com` -> This specifies which domain can send mail
- `-all` -> non-authorized emails will be rejected

Refer to the SPF Record Syntax on dmarcian [here](https://dmarcian.com/spf-syntax-table/) and [here](https://dmarcian.com/what-is-the-difference-between-spf-all-and-all/) .

Let's look at Twitter's SPF record using dmarcian's SPF Surveyor [tool](https://dmarcian.com/spf-survey/) .

![[Pasted image 20250723163548.png | 900]]


> **Refer to this resource on [dmarcian](https://dmarcian.com/create-spf-record/) on how to create your own SPF records.**

---

## Let's look at another sample.

The image below is from [Google Admin Toolbox Messageheader](https://toolbox.googleapps.com/apps/messageheader/), which was used to analyze a malicious email.

![](https://tryhackme-images.s3.amazonaws.com/user-uploads/5de58e2bfac4a912bcc7a3e9/room-content/5d9bea5f9fd4e1409d4cb28bfdfea94e.png)

The above image shows the status of an SPF record check. It reports back as **softfail**.

**Note**: Even though this task uses [dmarcian](https://dmarcian.com/) for SPF-related information and online checks, many other companies do the same.


Another site that we might use is: https://mxtoolbox.com/EmailHeaders.aspx

## **Mechanisms**

Mechanisms can be used to describe the set of hosts which are designated outbound mailers for the domain and can be prefixed with one of four qualifiers:

`+ Pass  `

`~ SoftFail  `

`- Fail  `

`? Neutral  `

If a mechanism results in a hit, its qualifier value is used. The default qualifier is “+“, i.e. “Pass”. Mechanisms are evaluated in order. If no mechanism or modifier matches, the default result is “Neutral”.

## Evaluation of an SPF record can return any of these results:

|Result|Explanation|Intended Action|
|---|---|---|
|Pass|The SPF record designates the host to be allowed to send|Accept|
|Fail|The SPF record has designated the host as NOT being allowed to send|Reject|
|SoftFail|The SPF record has designated the host as NOT being allowed to send but is in transition|Accept but mark|
|Neutral|The SPF record specifies explicitly that nothing can be said about validity|Accept|
|None|The domain does not have an SPF record or the SPF record does not evaluate to a result|Accept|
|PermError|A permanent error has occurred (eg. badly formatted SPF record)|Unspecified|
|TempError|A transient error has occurred|Reject|

---

#### More in-depth information on the differences between “~” and “–” can be found [here](https://dmarcian.com/what-is-the-difference-between-spf-all-and-all/)

If a domain has no SPF record at all, the result is “None”. If a domain has a temporary error during DNS processing, you get the result “TempError” (called “error” in earlier drafts). If a syntax or evaluation error occurs (eg. the domain specifies an unrecognized mechanism) the result is “PermError” (formerly “unknown”).


What is the meaning of the **-all** tag? `fail`

