function encode(code) {
    const b = 'QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcvbnm!@#$%^&*()<>';
    const dn = "L11Li1LI1LI1LLI11iLli1LIi1L1ILli1";

    function randomizeString(str) {
        const t = str.split('');
        for (let i = t.length - 1; i > 0; i--) {
            const j = Math.floor(Math.random() * (i + 1));
            [t[i], t[j]] = [t[j], t[i]];
        }
        return t.join('');
    }

    const func = randomizeString(dn);
    const dec = `
    function i${func}(data, b, z, x, q, w, e, r)
        data = string.gsub(data, '[^'..b..'=]', '')
        return (data:gsub('.', function(x)
            if (x == '=') then return '' end
            local r,f='',(b:find(x)-1)
            for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end
            return r;
        end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
            if (#x ~= 8) then return '' end
            local c=0
            for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end
            return string.char(c)
        end))
    end
`;

    function to_base64(data) {
        const b64Chars = b;
        const binary = data.split('').map(char => {
            let binaryChar = char.charCodeAt(0).toString(2);
            while (binaryChar.length < 8) {
                binaryChar = '0' + binaryChar;
            }
            return binaryChar;
        }).join('') + '0000';

        return binary.match(/[01]{6}/g).map(bin => {
            if (bin.length < 6) return '';
            const index = parseInt(bin, 2);
            return b64Chars.charAt(index);
        }).join('') + ['','==','='][data.length % 3];
    }

    const randomizedB = randomizeString(b);
    const idk = dec.replace(/\n/g, '');
    const result = `${idk} loadstring(i${func}('${to_base64(code)}', '${randomizedB}', '${randomizeString(b)}', '${randomizeString(b)}', '${randomizeString(b)}', '${randomizeString(b)}', '${randomizeString(b)}', '${randomizeString(b)}'))()`;
    return result;
}
