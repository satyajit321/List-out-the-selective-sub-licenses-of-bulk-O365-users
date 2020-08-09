<p>&nbsp;</p>
<div></div>
<div><strong>Description:</strong></div>
<div></div>
<div>This script allows to list out the selective sub-licenses of bulk O365 users</div>
<div></div>
<div><strong>Sample Script Run and Output:</strong></div>
<p>&nbsp;</p>
<p>&nbsp;</p>
<div class="scriptcode">
<div class="pluginEditHolder" pluginCommand="mceScriptCode">
<div class="title"><span>PowerShell</span></div>
<div class="pluginLinkHolder"><span class="pluginEditHolderLink">Edit</span>|<span class="pluginRemoveHolderLink">Remove</span></div>
<span class="hidden">powershell</span>
<pre class="hidden">.EXAMPLE
PS C:\Users\Satyajit\Scripts&gt; gc users.txt
satyajit.kurmam@contoso.com
satyajit.arora@contoso.com


PS C:\Users\Satyajit\Scripts&gt;  .\Get-AzureADUserLicense.ps1
UserPrincipalName,Exchange,SharePoint
satyajit.kurmam@contoso.com,Enabled,Enabled
satyajit.arora@contoso.com,Enabled,Enabled</pre>
<div class="preview">
<pre class="powershell">.EXAMPLE&nbsp;
<span class="powerShell__alias">PS</span>&nbsp;C:\Users\Satyajit\Scripts&gt;&nbsp;<span class="powerShell__alias">gc</span>&nbsp;users.txt&nbsp;
satyajit.kurmam@contoso.com&nbsp;
satyajit.arora@contoso.com&nbsp;
&nbsp;
&nbsp;
<span class="powerShell__alias">PS</span>&nbsp;C:\Users\Satyajit\Scripts&gt;&nbsp;&nbsp;.\Get<span class="powerShell__operator">-</span>AzureADUserLicense.ps1&nbsp;
UserPrincipalName,Exchange,SharePoint&nbsp;
satyajit.kurmam@contoso.com,Enabled,Enabled&nbsp;
satyajit.arora@contoso.com,Enabled,Enabled</pre>
</div>
</div>
</div>
<div class="endscriptcode">&nbsp;</div>
<p><br /> <br /> NOTE:- This takes lot of time to run and best results are when you break it into batches of 2000 users.</p>
<div>
<div class="m_-1470344528698663096gmail_signature" dir="ltr">
<div dir="ltr"></div>
</div>
</div>
<p>&nbsp;</p>
<p>&nbsp;</p>
<div>Use the logic in the script to develop or modify the same. It can be used to export to a text file as well.</div>
<div></div>
<div></div>
<div>Similar logic can be used for MSOL users too, I have used AzureAD cmdlets.</div>
<div></div>
<div><strong>Download the script's related files here:</strong></div>
<div></div>
<div></div>
<p>&nbsp;</p>
<p>Input file containing the userprincipalnames</p>
<p><a id="224032" href="/site/view/file/224032/1/users.txt">users.txt</a></p>
<p>Sample Result file if commented export portion used:</p>
<p><a id="224033" href="/site/view/file/224033/1/Licenses.csv">Licenses.csv</a></p>
