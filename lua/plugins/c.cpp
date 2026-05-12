#include <bits/stdc++.h>
using namespace std;
#ifdef MYPC
#include "debug.cpp"
#else
#define debug(...)
#define debugArr(...)
#endif
#include <ext/pb_ds/assoc_container.hpp>
using namespace __gnu_pbds;
template <class T>
using Tree =tree<T, null_type, less<T>, rb_tree_tag, tree_order_statistics_node_update>;

#define pb push_back
#define eb emplace_back
#define fi first
#define se second
#define int long long
typedef pair<int, int> pint;
#define vint vector<int>
#define fast_cin()															 \
	ios_base::sync_with_stdio(false);										  \
	cin.tie(NULL);															 \
	cout.tie(NULL)
constexpr int mod = 1e9+7;

void solve() {
	int n; cin>>n;
	int a[n];
}
signed main() {
	fast_cin();
#ifdef MYPC
	freopen("input.in", "r", stdin);
	//freopen("input.out","w",stdout);
#else
	string filename="";
	if(!filename.empty()) {
		freopen((filename+".in").c_str(), "r", stdin);
		freopen((filename+".out").c_str(), "w", stdout);
	}
#endif
	int t;
	t=1;
	cin >> t;
	while (t--) {
		solve();
	}
	return 0;
}
