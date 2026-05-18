public class Main2 {
    public static void main(String[] args) {
        int[] ia = new int[1,3,5];
        String[] sa = new String[3];
        sa[0] = "Java";
        sa[1] = "Ruby";
        sa[2] = "C++";
        for (int i=0; i<sa.length; i++){
            System.out.println(sa[i]);
        }
        System.out.println();
        for(int i : ia){
            System.out.println(i + ",");
        }
        System.out.println();

        static int max(int x, int y) {
            if (x > y) {
                return x;
            } else {
                return y;
            }
        }
    }
}