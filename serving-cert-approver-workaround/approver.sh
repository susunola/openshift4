echo "Logged-in as: `oc whoami`"

csrcount=`oc get csr | grep -i Pending |wc -l`
pendingcsr=`oc get csr | grep -i Pending  | awk '{print $1}'`

if [ $csrcount -gt 0 ]
then
  echo "Listing all Pending CSRs..."
  oc get csr | grep Pending

  for csr in $pendingcsr; do
	  oc adm certificate approve $csr
  done  
else
  echo "No Node Serving Certificate CSR in pending approval state..."
fi
